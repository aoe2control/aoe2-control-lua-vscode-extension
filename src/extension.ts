import * as path from 'path';
import * as vscode from 'vscode';
import { mergeLibrarySetting } from './librarySetting';

// Activates in workspaces that contain CONTROL entry files (*.main.lua or
// *.main.module); see activationEvents in package.json.
export function activate(context: vscode.ExtensionContext) {
	injectControlApiLibrary(context);
}

/**
 * Adds the CONTROL API definitions to Lua.workspace.library so the Lua
 * Language Server (sumneko.lua) offers completion and hover help for them.
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
	// The effective value: a workspace array replaces the user array, so user
	// entries must be carried into it.
	const current = luaConfig.get<unknown>('workspace.library');
	const merged = mergeLibrarySetting(current, definitionsPath);
	if (!merged) {
		return;
	}

	Promise.resolve(luaConfig.update('workspace.library', merged, vscode.ConfigurationTarget.Workspace)).catch((error: unknown) => {
		vscode.window.showWarningMessage(
			`AoE2 CONTROL: could not add the API definitions to Lua.workspace.library: ${String(error)}`);
	});
}

export function deactivate() {}
