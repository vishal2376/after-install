local function showChapterTitle()
    local chapterTitle = mp.get_property_osd("chapter-metadata/by-key/title")
    mp.set_property("osd-align-y", "bottom")
    mp.osd_message(chapterTitle, 3)
end

mp.observe_property("chapter", nil, showChapterTitle)