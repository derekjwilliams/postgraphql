import type {
  ExecutionDetails,
  GrafastResultsList,
  UnbatchedExecutionExtra,
} from "../interfaces.js";
import type { ExecutableStep } from "../step.js";
import { UnbatchedExecutableStep } from "../step.js";
import type { ConnectionCapableStep } from "./connection.js";
import { itemsOrStep } from "./connection.js";
import { ListStep } from "./list.js";

export class FirstStep<TData> extends UnbatchedExecutableStep<TData> {
  static $$export = {
    moduleName: "grafast",
    exportName: "FirstStep",
  };
  isSyncAndSafe = true;
  allowMultipleOptimizations = true;

  constructor(
    parentPlan:
      | ExecutableStep<ReadonlyArray<TData>>
      | ConnectionCapableStep<ExecutableStep<TData>, any>,
  ) {
    super();
    this.addDependency(itemsOrStep(parentPlan));
  }

  execute({
    indexMap,
    values: [values0],
  }: ExecutionDetails<[ReadonlyArray<TData>]>): GrafastResultsList<TData> {
    return indexMap((i) => values0.at(i)?.[0]);
  }

  unbatchedExecute(_extra: UnbatchedExecutionExtra, list: any[]) {
    return list?.[0];
  }

  deduplicate(peers: FirstStep<TData>[]): FirstStep<TData>[] {
    return peers;
  }

  optimize() {
    const parent = this.getDep(0);
    // The first of a list plan is just the first dependency of the list plan.
    if (parent instanceof ListStep) {
      return parent.first();
    }
    return this;
  }
}

/**
 * A plan that resolves to the first entry in the list returned by the given
 * plan.
 */
export function first<TData>(
  plan:
    | ExecutableStep<ReadonlyArray<TData>>
    | ConnectionCapableStep<ExecutableStep<TData>, any>,
): FirstStep<TData> {
  return plan.operationPlan.cacheStep(
    plan,
    "GrafastInternal:first()",
    "",
    () => new FirstStep(plan),
  );
}
