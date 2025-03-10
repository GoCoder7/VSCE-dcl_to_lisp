import * as vscode from "vscode";

export function getSelectedText() {
  const ed = vscode.window.activeTextEditor;
  if (ed) {
    const doc = ed.document;
    const selected = ed.selection;
    return doc.getText(selected);
  }
}

export function copyToClipboard(text: string) {
  vscode.env.clipboard.writeText(text);
}

export const strAfter = (
  src: string,
  ptn: string,
  include: boolean = false
) => {
  if (!src.includes(ptn)) {
    return null;
  }
  return include
    ? src.slice(src.indexOf(ptn))
    : src.slice(src.indexOf(ptn) + ptn.length);
};
