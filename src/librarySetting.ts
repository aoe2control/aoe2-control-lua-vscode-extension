/**
 * Computes the new value of the Lua Language Server setting
 * `Lua.workspace.library`, which is an array of paths.
 *
 * - Keeps every existing entry that is not a CONTROL definitions folder.
 * - Converts the object form that earlier versions of this extension wrote
 *   (`{ "<path>": true }`) back to an array.
 * - Replaces definitions folders of other extension versions with the current one.
 *
 * Returns undefined when the setting already has the right value.
 */
export function mergeLibrarySetting(current: unknown, definitionsPath: string): string[] | undefined {
	const entries: string[] = [];
	if (Array.isArray(current)) {
		for (const entry of current) {
			if (typeof entry === 'string') {
				entries.push(entry);
			}
		}
	} else if (current !== null && typeof current === 'object') {
		for (const [key, value] of Object.entries(current as Record<string, unknown>)) {
			if (value && /^\d+$/.test(key) && typeof value === 'string') {
				entries.push(value);
			} else if (value) {
				entries.push(key);
			}
		}
	}

	const isControlDefinitions = (entry: string) =>
		/aoe2-control-lua[^\\/]*[\\/]definitions[\\/]?$/i.test(entry);
	const merged: string[] = [];
	for (const entry of entries) {
		if (isControlDefinitions(entry) || merged.includes(entry)) {
			continue;
		}
		merged.push(entry);
	}
	merged.push(definitionsPath);

	const unchanged = Array.isArray(current) &&
		current.length === merged.length &&
		current.every((entry, index) => entry === merged[index]);
	return unchanged ? undefined : merged;
}
