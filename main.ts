import { copyFileSync, mkdirSync } from 'node:fs';
import { join } from 'node:path';

const botDir = process.env.MAKEFUN_BOT_DIR || '/bot';
const outputDir = process.env.MAKEFUN_OUTPUT_DIR || '/output';

try {
  mkdirSync(outputDir, { recursive: true });
  copyFileSync(join(botDir, 'POST.json'), join(outputDir, 'POST.json'));
} catch (err) {
  console.error(err);
  process.exit(1);
}
