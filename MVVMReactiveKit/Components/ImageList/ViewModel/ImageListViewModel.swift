//
//  Copyright © 2019 An Tran. All rights reserved.
//

import ReactiveKit
import PromiseKit

class ImageListViewModel: ViewModel {

    // MARK: Properties

    // Public

    var searchTerm = Property<String?>(nil)
    var imageList = Property(ImageList(total: 0, totalHits: 0, hits: []))

    let activty = Subject<Bool, Never>()
    
    // Private

    private let disposeBag = DisposeBag()

    // MARK: APIs

    override init(service: ServiceProtocol) {
        super.init(service: service)

        _ = searchTerm.observeNext { [unowned self] value in
            guard let value = value else {
                self.imageList.value = ImageList(total: 0, totalHits: 0, hits: [])
                return
            }

            if value.count > 2 {
                self.fetchImage(searchTerm: value)
            }
        }.dispose(in: disposeBag)
    }

    func fetchImage(searchTerm: String) {
        activty.next(true)
        pixelBayService.fetch(searchTerm: searchTerm)
            .done { [weak self] imageList in
                self?.imageList.value = imageList
            }
            .catch { error in
                print(error)
            }
            .finally {
                self.activty.next(false)
            }
    }
}

extension ImageListViewModel {
    var pixelBayService: PixelBayService {
        return service as! PixelBayService
    }
}
