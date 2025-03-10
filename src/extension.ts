import * as vscode from "vscode";
import { commandHandler } from "./command";

export function activate(context: vscode.ExtensionContext) {
  const commandId = "dclToAutolisp.autolispdcl";
  const command = vscode.commands.registerCommand(commandId, commandHandler);
  context.subscriptions.push(command);
}

export function deactivate() {}
