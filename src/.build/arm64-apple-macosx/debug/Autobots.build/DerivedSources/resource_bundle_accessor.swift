import class Foundation.Bundle

extension Foundation.Bundle {
    static let module: Bundle = {
        let mainPath = Bundle.main.bundleURL.appendingPathComponent("Autobots_Autobots.bundle").path
        let buildPath = "/Users/nk.gorbunoff/Development/ga/n7-github-action/src/.build/arm64-apple-macosx/debug/Autobots_Autobots.bundle"

        let preferredBundle = Bundle(path: mainPath)

        guard let bundle = preferredBundle ?? Bundle(path: buildPath) else {
            fatalError("could not load resource bundle: from \(mainPath) or \(buildPath)")
        }

        return bundle
    }()
}