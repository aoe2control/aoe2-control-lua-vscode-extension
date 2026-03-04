// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as path from 'path';
import * as vscode from 'vscode';

// This method is called when your extension is activated
// Your extension is activated the very first time the command is executed
export function activate(context: vscode.ExtensionContext) {

	// Use the console to output diagnostic information (console.log) and errors (console.error)
	// This line of code will only be executed once when your extension is activated
	console.log('Congratulations, your extension "aoe2-control-lua" is now active!');

	// Inject CONTROL API definitions into Lua workspace library for IntelliSense
	injectControlApiLibrary(context);

	// The command has been defined in the package.json file
	// Now provide the implementation of the command with registerCommand
	// The commandId parameter must match the command field in package.json
	const disposable = vscode.commands.registerCommand('aoe2-control-lua.helloWorld', () => {
		// The code you place here will be executed every time your command is executed
		// Display a message box to the user
		vscode.window.showInformationMessage('Hello World from aoe2-control-lua!');
	});

	context.subscriptions.push(disposable);
}

/**
 * Injects the CONTROL API definitions path into Lua.workspace.library so the
 * Lua Language Server (sumneko.lua) provides IntelliSense for the CONTROL engine.
 */
function injectControlApiLibrary(context: vscode.ExtensionContext): void {
	const autoInject = vscode.workspace.getConfiguration('aoe2ControlLua').get<boolean>('autoInjectLibrary', true);
	if (!autoInject) {
		return;
	}

	const workspaceFolders = vscode.workspace.workspaceFolders;
	if (!workspaceFolders || workspaceFolders.length === 0) {
		return;
	}

	const definitionsPath = path.join(context.extensionPath, 'definitions');
	const luaConfig = vscode.workspace.getConfiguration('Lua');
	const currentLibrary = luaConfig.get<Record<string, boolean | string>>('workspace.library') ?? {};

	// Avoid re-adding if already present
	if (currentLibrary[definitionsPath]) {
		return;
	}

	const merged = { ...currentLibrary, [definitionsPath]: true };
	luaConfig.update('workspace.library', merged, vscode.ConfigurationTarget.Workspace);
}

// This method is called when your extension is deactivated
export function deactivate() {}
