// Blocks host-level php/composer/yarn in IWF projects (.iwf.yml present) —
// those must run inside the container via the `iwf` CLI. Throwing in
// tool.execute.before fails the bash call before execution and the error
// message is returned to the model (verified against opencode v1.17.15).
import { existsSync } from "node:fs";
import { join } from "node:path";

const HOST_BLOCKED = /(^|[;&|]\s*)(php|composer|yarn)\b/;

export const server = async (ctx) => {
  const root = ctx.worktree || ctx.directory || process.cwd();

  return {
    "tool.execute.before": async (input, output) => {
      if (input?.tool !== "bash") return;
      if (!existsSync(join(root, ".iwf.yml"))) return;
      const command = String(output?.args?.command ?? "");
      if (HOST_BLOCKED.test(command)) {
        throw new Error(
          "IWF project (.iwf.yml present): don't run php/composer/yarn on the host. " +
          'Use the iwf CLI instead — `iwf composer ...`, `iwf yarn ...`, ' +
          '`iwf symfony console ...`, or `iwf run "..."` for arbitrary commands.'
        );
      }
    },
  };
};
