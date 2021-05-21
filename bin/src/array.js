#!/home/nino/.deno/bin/deno run
const decoder = new TextDecoder();
let text = '';
for await (const chunk of Deno.iter(Deno.stdin)) {
  text += decoder.decode(chunk);
}
const code = text + Deno.args[0];
const result = eval(code);
const encoder = new TextEncoder();
const output = encoder.encode(JSON.stringify(result, null, 2)+'\n');
await Deno.stdout.write(output);
