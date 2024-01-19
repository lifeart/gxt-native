import { defineConfig } from "vite";
import { compiler } from '@lifeart/gxt/compiler';


export default defineConfig(({ mode }) => ({
  plugins: [compiler(mode)],
  // appType: 'custom',
  define: {
    IS_DEV_MODE: true,
  },
  build: {
    write: true,
    modulePreload: false,
    target: "es2020",
    minify: 'esbuild',
    lib: {
      'entry': 'src/entry.ts',
      'name': 'app',
      'formats': ['iife'],
    },
    rollupOptions: {
      treeshake: "recommended",
      onwarn(warning, warn) {
        // suppress eval warnings (we use it for HMR)
        if (warning.code === "EVAL") return;
        warn(warning);
      },
    }
  },
}));