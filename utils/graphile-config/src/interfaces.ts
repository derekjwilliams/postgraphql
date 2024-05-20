export type AnyCallback = (...args: any[]) => any;

export type OrderedCallback<T extends AnyCallback> = {
  provides?: string[];
  before?: string[];
  after?: string[];
  callback: T;
};

export type PromiseOrDirect<T> = T | PromiseLike<T>;

export type CallbackDescriptor<T extends AnyCallback> = T | OrderedCallback<T>;

export type UnwrapCallback<T extends CallbackDescriptor<AnyCallback>> =
  T extends CallbackDescriptor<infer U> ? U : never;

export type FunctionalityObject<T> = Record<
  keyof T,
  CallbackDescriptor<AnyCallback>
>;
