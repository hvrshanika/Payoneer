
import UIKit
import Foundation
public class ImageCache {
    
    public static let publicCache = ImageCache()
    
    private let cachedImages = NSCache<NSURL, UIImage>()
    private var loadingResponses = [NSURL: [(PayMode, UIImage?) -> Swift.Void]]()
    
    public final func getPlaceholderImage() -> UIImage {
        if #available(iOS 13, *) {
            return UIImage(systemName: "tag.circle")!
        }
        else {
            return UIImage(named: "tag.circle")!
        }
    }
    
    public final func image(url: NSURL) -> UIImage? {
        return cachedImages.object(forKey: url)
    }
    /// - Tag: cache
    // Returns the cached image if available, otherwise asynchronously loads and caches it.
    final func load(url: NSURL, item: PayMode, completion: @escaping (PayMode, UIImage?) -> Swift.Void) {
        // Check for a cached image.
        if let cachedImage = image(url: url) {
            DispatchQueue.main.async {
                completion(item, cachedImage)
            }
            return
        }
        // In case there are more than one requestor for the image, we append their completion block.
        if loadingResponses[url] != nil {
            loadingResponses[url]?.append(completion)
            return
        } else {
            loadingResponses[url] = [completion]
        }
        
        // Go fetch the image.
        ImageURLProtocol.urlSession().dataTask(with: url as URL) { (data, response, error) in
            DispatchQueue.main.async {
                // Check for the error, then data and try to create the image.
                guard let responseData = data, let image = UIImage(data: responseData),
                      let blocks = self.loadingResponses[url], error == nil else {
                    completion(item, nil)
                    self.loadingResponses[url] = nil
                    return
                }
                // Cache the image.
                self.cachedImages.setObject(image, forKey: url, cost: responseData.count)
                // Iterate over each requestor for the image and pass it back.
                for block in blocks {
                    block(item, image)
                }
                self.loadingResponses[url] = nil
            }
        }.resume()
    }
        
}

