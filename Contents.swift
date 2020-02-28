import Cocoa

protocol Previewable {
    var textPreview: String { get }
}

class FeedItem: Previewable {
    var text: String
    var itemsArray: [Item] = []
    var textPreview: String {
        get {
            return String(text.split(separator: ".").first ?? "")
        }
    }
    var readingTime: Double {
        return 0.6 * Double(text.count)
    }
    
    init(_ text: String) {
        self.text = text
    }
    
    func getReadingTime()->Double{
        return readingTime
    }
}

class Item {
    var readingSpeed: Double
    init(_ read: Double) {
        readingSpeed = read
    }
    func getReadingSpeed()->Double {
        return readingSpeed
    }
}

class Video:Item {}

class Audio:Item {}

class Image:Item {
    init() {
        super.init(10)
    }
}

func getPreviews<T: Previewable>(_ array: [T])->[String] {
    var previews: [String] = []
    for i in array {
        previews.append(i.textPreview)
    }
    return previews
}

var myItem = FeedItem("Properties associate values with a particular class, structure, or enumeration. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value. Computed properties are provided by classes, structures, and enumerations. Stored properties are provided only by classes and structures.")

print(myItem.textPreview + "...")

var previewableArray = [FeedItem("Properties associate values with a particular class, structure, or enumeration. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value. Computed properties are provided by classes, structures, and enumerations. Stored properties are provided only by classes and structures."),FeedItem("hi. ma. fggd d"),FeedItem("HHH fdsf. magf gfsg sg. fggd d")]

print(getPreviews(previewableArray))
