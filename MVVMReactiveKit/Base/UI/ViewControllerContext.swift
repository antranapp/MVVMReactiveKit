//
//  Copyright © 2019 An Tran. All rights reserved.
//

protocol ViewControllerContextHolder: class {
    var context: ViewControllerContext! { get set }
}

class ViewControllerContext {

    public var pixelBayService: ServiceProtocol

    init(pixelBayService: ServiceProtocol) {
        self.pixelBayService = pixelBayService
    }
}
