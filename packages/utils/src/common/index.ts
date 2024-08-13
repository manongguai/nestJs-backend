import { isEmptyObject } from "../is";

/**
 * 序列化地址信息
 * @param {String} url 地址信息
 * @param {Object} [params={}] 参数信息
 * @return {String} 拼接完成后的完整地址
 */
const invalidQueryValues = ["undefined", "null", ""];
export function serializeUrl<T extends Record<string, any>>(url: string, params: T): string {
  if (!isEmptyObject(params)) {
    let queryString = "";
    if (!url.match(/\?/)) {
      queryString += "?";
    }
    for (const key in params) {
      const value = params[key];
      if (~invalidQueryValues.indexOf(value + "")) {
        continue;
      }
      queryString += `&${key}=${value}`;
    }
    url = url + queryString;
    url = url.replace(/\?&/, "?").replace(/\?$/, "");
  }
  return url;
}

/**
 * 删除对象中为false的键值对
 */
export function removeEmptyValues(obj: Record<string, any>) {
  return Object.fromEntries(Object.entries(obj).filter(([, value]) => value != null && value !== ""));
}

/**
 * 生成UUID
 */
export const uuid = (): string => {
  let d: number = Date.now();

  const d2: number = (performance && performance.now && performance.now() * 1000) || 0;

  return "ddxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, (c: string) => {
    let r: number = Math.random() * 16;

    if (d > 0) {
      r = (d + r) % 16 | 0;
      d = Math.floor(d / 16);
    } else {
      r = (d2 + r) % 16 | 0;
      d = Math.floor(d2 / 16);
    }

    const v: number = c === "x" ? r : (r & 0x3) | 0x8;
    return v.toString(16);
  });
};

/**
 * 生成短UUID
 */
export const shortUuid = () => {
  return "xxxxxx".replace(/x/g, function () {
    return Math.floor(Math.random() * 16).toString(16);
  });
};

/**
 * 指定返回字符串长度，并添加...
 */
export function interceptString(str: string = "", place: number, isEllipsis = true): string {
  if (!str) return str;
  if (str.length > place) {
    return str.substr(0, place) + (isEllipsis ? "..." : "");
  }
  return str.substr(0, place);
}
