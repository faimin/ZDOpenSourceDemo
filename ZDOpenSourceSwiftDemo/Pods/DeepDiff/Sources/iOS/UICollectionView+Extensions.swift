import UIKit

public extension UICollectionView {

  /// Animate reload in a batch update
  ///
  /// - Parameters:
  ///   - changes: The changes from diff
  ///   - completion: Called when operation completes
  public func reload<T: Equatable & Hashable>(
    changes: [Change<T>],
    completion: @escaping (Bool) -> Void) {

    let changesWithIndexPath = IndexPathConverter().convert(changes: changes)

    // reloadRows needs to be called outside the batch

    performBatchUpdates({
      internalBatchUpdates(changesWithIndexPath: changesWithIndexPath)
    }, completion: completion)

    changesWithIndexPath.replaces.executeIfPresent {
      self.reloadItems(at: $0)
    }
  }

  // MARK: - Helper

  private func internalBatchUpdates(changesWithIndexPath: ChangeWithIndexPath) {
    changesWithIndexPath.deletes.executeIfPresent {
      deleteItems(at: $0)
    }

    changesWithIndexPath.inserts.executeIfPresent {
      insertItems(at: $0)
    }

    changesWithIndexPath.moves.executeIfPresent {
      $0.forEach { move in
        moveItem(at: move.from, to: move.to)
      }
    }
  }
}

