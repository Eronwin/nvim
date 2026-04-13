local status, persistence = pcall(require, "persistence")
if not status then
	return
end

persistence.setup({})
