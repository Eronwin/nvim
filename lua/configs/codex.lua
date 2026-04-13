local status, codex = pcall(require, "codex")
if not status then
	return
end

codex.setup({})
