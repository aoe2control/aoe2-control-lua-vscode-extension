import * as assert from 'assert';
import { mergeLibrarySetting } from '../librarySetting';

suite('Lua.workspace.library merge', () => {
	const current = 'C:/ext/bigjohn.aoe2-control-lua-0.9.1/definitions';
	const older = 'C:/ext/bigjohn.aoe2-control-lua-0.9.0/definitions';

	test('adds the definitions to an empty setting', () => {
		assert.deepStrictEqual(mergeLibrarySetting(undefined, current), [current]);
	});

	test('keeps existing entries', () => {
		assert.deepStrictEqual(mergeLibrarySetting(['C:/lib'], current), ['C:/lib', current]);
	});

	test('converts the object form written by earlier versions', () => {
		assert.deepStrictEqual(
			mergeLibrarySetting({ '0': 'C:/lib', [older]: true }, current),
			['C:/lib', current]);
	});

	test('replaces older definitions folders and removes duplicates', () => {
		assert.deepStrictEqual(
			mergeLibrarySetting(['C:/lib', older, 'C:/lib'], current),
			['C:/lib', current]);
	});

	test('leaves a correct setting unchanged', () => {
		assert.strictEqual(mergeLibrarySetting(['C:/lib', current], current), undefined);
	});
});
