
import Foundation

// MARK: NSRange <-> Range<Int> conversion

public extension NSRange {
	public var range: CountableRange<Int> {
		return location..<location+length
	}
	
	public init(range: Range<Int>) {
		location = range.lowerBound
		length = range.upperBound - range.lowerBound
	}
}

// MARK: NSIndexSet -> [NSIndexPath] conversion

public extension IndexSet {
	/**
	Returns an array of NSIndexPaths that correspond to these indexes in the given section.
	
	When reporting changes to table/collection view, you can improve performance by sorting
	deletes in descending order and inserts in ascending order.
	*/
	public func indexPathsInSection(_ section: Int, ascending: Bool = true) -> [IndexPath] {
		var result: [IndexPath] = []
		result.reserveCapacity(count)
		
		enumerated().forEach { (index, elemet) in
			result.append(NSIndexPath(indexes: [section, index], length: 2) as IndexPath)
		}
		
		return result
	}
}

// MARK: NSIndexSet support

public extension Array {
	
	public subscript (indexes: IndexSet) -> [Element] {
		var result: [Element] = []
		result.reserveCapacity(indexes.count)
		(indexes as NSIndexSet).enumerateRanges({ nsRange, _ in
			result += self[nsRange.range]
		})
		return result
	}
	
	public mutating func removeAtIndexes(_ indexSet: IndexSet) {
		(indexSet as NSIndexSet).enumerateRanges(options: .reverse) { nsRange, _ in
			self.removeSubrange(nsRange.range)
		}
	}
	
	public mutating func insertElements(_ newElements: [Element], atIndexes indexes: IndexSet) {
		assert(indexes.count == newElements.count)
		var i = 0
		(indexes as NSIndexSet).enumerateRanges({ range, _ in
			self.insert(contentsOf: newElements[i..<i+range.length], at: range.location)
			i += range.length
		})
	}
}
