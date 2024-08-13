interface EnvFunction {
  (key: string, defaultValue?: string): string | undefined;
  bool(key: string, defaultValue?: string): boolean;
  number(key: string, defaultValue?: string): number;
}

// 先声明基础的 env 函数
const env = ((key: string, defaultValue?: string) => {
  return process.env[key] || defaultValue;
}) as EnvFunction;

// 为 env 函数添加 bool 方法
env.bool = (key: string, defaultValue?: string) => {
  return Boolean(env(key, defaultValue));
};

// 为 env 函数添加 number 方法
env.number = (key: string, defaultValue?: string) => {
  return Number(env(key, defaultValue));
};

export { env };
