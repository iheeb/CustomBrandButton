# Design System Case Study - Brand Button


# Brand Button Component
The Brand Button component is a customizable button designed for use within a design system. It includes various styling options. The component is implemented as a Swift class with accompanying ViewModel and Styler classes for managing its appearance and behavior.

### BrandButtonViewModel
The BrandButtonViewModel class represents the data model for the Brand Button. It encapsulates properties such as label text, button variant, icons, button width, and other styling attributes.

Properties
- label: The text displayed on the button. (required)
- variant: The visual style variant of the button (e.g., primary, secondary). (required)
- leadingIcon: An optional leading icon displayed before the button text. (optional)
- trailingIcon: An optional trailing icon displayed after the button text. (optional)
- iconColor: The color of the icons. (optional)
- fullWidth: A boolean indicating whether the button should take up the full width. (optional)
- isButtonEnabled: A boolean indicating whether the button is enabled or disabled. (optional)
- size: The size variant of the button (e.g., regular, medium). (optional)
- font: The custom font applied to the button text. (optional)
- fontColor: The color of the button text. (optional)

### BrandButtonDelegate
The BrandButtonDelegate protocol defines a method buttonTapped, implemented by the delegate to handle button tap events.

### BrandButton
The BrandButton class is a subclass of UIButton that incorporates the Brand Button styling. It includes a viewModel property for data binding and a delegate for handling button tap events.

### BrandButtonStyler
The BrandButtonStyler class contains static methods to apply styling to the BrandButton based on the provided BrandButtonViewModel.

# Example Usage
Drag and drop the Component into your project, provide the resources and assets:
![Screenshot 2024-03-02 at 04 09 39](https://github.com/iheeb/CustomBrandButton/assets/6699068/85b561a2-d5af-4bd9-967a-52677f6437d7)

### Initialization:
```swift
let myButton = BrandButton(tag: 1)
```
### Configuration:
```swift
let buttonModel = BrandButtonViewModel(
    label: "Press Me",
    variant: .primaryBlue,
    leadingIcon: UIImage(named: "icon")
)
myButton.viewModel = buttonModel
```
### Delegate Implementation:
```swift
extension ViewController: BrandButtonDelegate {
    func buttonTapped(_ button: BrandButton, withTag tag: Int) {
        // Handle button tap based on the tag.
    }
}
```

### Customisation
We have two main/default styles : .primary and .secondary and each have a blue and a green variant.
Beyond that we can customise the rest of the button:
- Button can have two icons
- Icons color
- FullWidth
- Font style
- Font size
- Font color
```swift
let buttonViewModel = BrandButtonViewModel(
            label: NSLocalizedString("buttonTitle", comment: ""),
            variant: .primaryBlue,
            leadingIcon: UIImage(systemName: "apple.logo"),
            iconColor: .white,
            font: UIFont.boldSystemFont(ofSize: 20),
            fontColor: .black)
let customButton = BrandButton(tag: 8)
customButton.viewModel = buttonViewModel
customButton.delegate = self
view.addSubview(customButton)
```
# Video showcase:
In the video I am clicking on the buttons and they are getting highlighted, more visible on the filled buttons.

https://github.com/iheeb/CustomBrandButton/assets/6699068/01c8ee6c-0966-4c1a-8556-d70209765799


