import { isString } from "./is";

class ServerError extends Error {
  constructor(m: string) {
    super(m);
    this.name = "ClError";
  }
}

export function throwError(scope: string, m: string): never {
  throw new ServerError(`[${scope}] ${m}`);
}

export function debugWarn(err: Error): void;
export function debugWarn(scope: string, message: string): void;
export function debugWarn(scope: string | Error, message?: string): void {
  if (process.env.NODE_ENV !== "production") {
    const error: Error = isString(scope) ? new ServerError(`[${scope}] ${message}`) : scope;
    console.warn(error);
  }
}
