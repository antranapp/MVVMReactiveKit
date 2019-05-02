//
//  Copyright © 2019 An Tran. All rights reserved.
//

import UIKit

class ImageDetailViewController: ViewController {

    // MARK: Properties

    @IBOutlet weak var imageView: UIImageView!

    private let image: Image

    // MARK: Initialization

    init(context: ViewControllerContext, image: Image) {
        self.image = image
        super.init(context: context)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecyles

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Detail"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let url = URL(string: image.largeImageURL) else { return }

        imageView.kf.setImage(with: url)
    }

}
