function show_chapters()
    mp.command("show-text \"${chapter-list}\" 3000")
end

mp.add_key_binding("c", "show_chapters", show_chapters)
