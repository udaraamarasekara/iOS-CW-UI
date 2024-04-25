import SwiftUI
   
    extension Image {
        func uiImage() -> UIImage {
            let containerView = UIView(frame: CGRect(x:0,y:0,width:100,height:100))
            let hostingController = UIHostingController(rootView: self)
            containerView.addSubview(hostingController.view)
            hostingController.view.frame = containerView.bounds
            let renderer = UIGraphicsImageRenderer(size: containerView.bounds.size)
            return renderer.image { _ in
                containerView.drawHierarchy(in: containerView.bounds, afterScreenUpdates: true)
            }
        }
    }

    func imagesToData(images: [Image]) -> [UIImage] {
        return images.map { image in
            let uiImage = image.uiImage()
            return uiImage
        }
    }

    // Example usage
    
