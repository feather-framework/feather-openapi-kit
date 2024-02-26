import Foundation
import PackagePlugin

enum PluginError: Error {
    case noTarget(name: String)
}

@main struct FeatherOpenAPIGenerator {
    static func createBuildCommands(
        pluginWorkDirectory: Path,
        tool: (String) throws -> PluginContext.Tool,
        sourceFiles: FileList,
        targetName: String
    ) throws -> [Command] {
        let sourceDir = longestCommonFolderPath(sourceFiles.map(\.path.string))
        let output = pluginWorkDirectory.appending(
            "GeneratedComponentCollector.swift"
        )

        return [
            .buildCommand(
                displayName: "Generate ComponentCollector Code",
                executable: try tool(
                    "feather-openapi-generator"
                )
                .path,
                arguments: [sourceDir, output, targetName],
                environment: [:],
                inputFiles: [],
                outputFiles: [output]
            )
        ]
    }

    private static func longestCommonFolderPath(_ filePaths: [String]) -> String
    {
        guard !filePaths.isEmpty else { return "" }

        var commonComponents = filePaths.first!.components(separatedBy: "/")
        commonComponents.removeLast()

        for path in filePaths {
            let components = path.components(separatedBy: "/")
            for i in 0..<min(commonComponents.count, components.count)
            where commonComponents[i] != components[i] {
                commonComponents.removeLast(commonComponents.count - i)
                break
            }
        }

        return commonComponents.joined(separator: "/")
    }
}

extension FeatherOpenAPIGenerator: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target)
        async throws -> [Command]
    {
        guard let swiftTarget = target as? SwiftSourceModuleTarget else {
            throw PluginError.noTarget(name: target.name)
        }
        return try Self.createBuildCommands(
            //targetDirectory: target.directory,
            pluginWorkDirectory: context.pluginWorkDirectory,
            tool: context.tool,
            sourceFiles: swiftTarget.sourceFiles,
            targetName: target.name
        )
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension FeatherOpenAPIGenerator: XcodeBuildToolPlugin {
    func createBuildCommands(context: XcodePluginContext, target: XcodeTarget)
        throws -> [Command]
    {
        try Self.createBuildCommands(
            pluginWorkDirectory: context.pluginWorkDirectory,
            tool: context.tool,
            sourceFiles: target.inputFiles,
            targetName: target.displayName
        )
    }
}
#endif
