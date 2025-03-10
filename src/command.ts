import * as vscode from "vscode";
import { getSelectedText, copyToClipboard, strAfter } from "./utils";

export async function commandHandler() {
  try {
    runExtension();
  } catch {
    vscode.window.showErrorMessage("Error. Please try again.");
  }
}

async function runExtension() {
  // Get selected text
  const selected = getSelectedText();
  if (!selected) {
    vscode.window.showErrorMessage(
      "No text selected. Please select texts first."
    );
    return;
  }

  // Get function name
  const functionName = await inputFunctionName();

  const dclStr = strAfter(selected.replace(/"/g, '\\"'), ":", true);

  // Create lisp function string
  const lispFnStr = `
(defun ${functionName} ( / tempFilePath tempFile)
	(setq tempFilePath (vl-filename-mktemp "dcl.dcl"))
	(setq tempFile (open tempFilePath "w"))
	(write-line (strcat "
" (vl-filename-base tempFilePath) "
${dclStr}
	")	tempFile)
	(close tempFile)
	tempFilePath
)
`;

  // Copy to clipboard
  copyToClipboard(lispFnStr);
  vscode.window.showInformationMessage(
    `Done with function name '${functionName}'. Paste onto your Autolisp file(.lsp)`
  );
}

async function inputFunctionName() {
  const input = await vscode.window.showInputBox({
    placeHolder: "createDCL",
    title: "Function Name",
    prompt: "This is the function name in the Autolisp file",
  });
  return input ? input : "createDCL";
}
