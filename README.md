# SwiftUI TabView labels overlap in a sheet on macOS 27

This sample reproduces two text-only tab labels being drawn on top of each other in a tiny control during the initial presentation of a SwiftUI sheet.

## Steps to reproduce

1. Open `TabViewSheet.xcodeproj` in Xcode 27.
2. Select the `TabViewSheet` scheme and My Mac destination, then run the app on macOS 27.
3. Inspect the sheet that opens automatically. The "Tab A" and "Tab B" labels overlap and are truncated near the top center of the panel.

Expected behavior: Two separate, readable tab labels, with the selected label corresponding to the content page. The sheet is 450 points wide and has ample room for both labels.

Actual behavior: Both tabs are squished into a single, tiny, truncated square-ish region.

## Verified environment

| Component | Version |
| --- | --- |
| macOS | 27.0.1 (26A434) |
| Xcode | 27.0 (27A266a) |
| SDK | macOS 27.0 |
| Architecture | Apple silicon |
| Swift language mode | Swift 6 |

The deployment target is macOS 26.6 to allow comparison on earlier systems. This sample has been verified on the macOS 27 system listed above.

## Scope

The reproduction is contained in `TabViewSheet/ContentView.swift`. It uses a standard `TabView`, two `Text` labels, two simple content pages, and a sheet whose presentation state starts as `true`. The app has no external dependencies, custom tab styles, or layout callbacks.

The project uses ad hoc code signing and does not require a development team. The original starter project's app entry point is in `TabViewSheet/MyApp.swift`.

## Workaround

A native `Picker` using `.pickerStyle(.tabs)` and `.fixedSize()`, with the selected page displayed separately, renders correctly in the same presentation setup on macOS 27. Switching `TabView` to modern `Tab` declarations, using `.grouped` or `.tabBarOnly`, and adding sizing modifiers did not fix the failing initial layout.
