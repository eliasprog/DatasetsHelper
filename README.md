# DatasetsHelper

DatasetsHelper is a framework to ho help people to print, see and edit Datasets files content.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

DatasetsHelper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DatasetsHelper'
```

## How to use it

### Import the module:

```objectivec
@import DatasetsHelper;
```

### Create an instance of DatasetsHelper:

```swift
DatasetsHelper *datasetsHelper = [[DatasetsHelper alloc]init];
```

### To read a file containing a data set:

* Call the function `readFile` passing the name of the file and extension.

* Pass true to `withHeader` parameter if your file has a header.

* Then, pass the data type to each colum.

```objectivec
[datasetsHelper readFile: @"File" ofType: @"txt" withHeader: true columnTypes: @[@"string", @"string", @"string", @"string"]];
```

### To get the data from data set file:

* Call the function `getDataset`

```swift
NSArray * dataset = [datasetsHelper getDataset];
```

* The result is an bidirectional array. Access it by the indexes.

```swift
NSLog(@"%@", dataset[0][0]);
```

## Authors

Elias Ferreira, Mateus Nobre.

## License

DatasetsHelper is available under the MIT license. See the LICENSE file for more info.
