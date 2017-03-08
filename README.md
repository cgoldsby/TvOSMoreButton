# TvOSMoreButton
#### A basic tvOS button which truncates long text with '... More'. 

![](https://github.com/cgoldsby/TvOSMoreButton/blob/master/Artwork/example.png)

The TvOSMoreButton is a simple view which aims to mirror the behavior of Apple's "... More" button; as seen in the Movie App. 

If the text is too long to fit with in the button bounds then the text will be truncated and '... More' will be appended. If the text fits with in the bounds of the button then the button is not focusable.

When the button is focused, pressing the select on the Apple TV remote will trigger a callback.

## Customizations
The majority of the UI properies are configurable; like
- the button text
- ellipse text; defaults to '...'
- trailing text; defautls to "More"
- trailing text color and font
- the button text color and font
- shadows and radius
- and More 😉

## Usage
Check out the Example workspace for more details.

```swift
    private func setUpUI() {
        tvOSMoreButton.text = // Super long text
        tvOSMoreButton.buttonWasPressed = moreButtonWasPressed
    }
    
    private func moreButtonWasPressed(text: String?) -> Void {
        // Do something. May I suggest using TvOSTextViewerViewController 
        // to display the text in a full screen view!
        let viewController = TvOSTextViewerViewController()
        viewController.text = text
        viewController.textColor = .white
        viewController.textEdgeInsets = UIEdgeInsets(top: 100, left: 250, bottom: 100, right: 250)
        present(viewController, animated: true)
    }

```

If you would like to display a fullscreen view with just the text then definately check out [@dcordero](https://github.com/dcordero) awesome [TvOSTextViewer](https://github.com/dcordero/TvOSTextViewer). So good!

Feel free to submit an issues or PRs. ❤️
