tell application "Music"
	activate
	
	-- Ensure at least two albums are selected
	set selectedTracks to selection
	if (count of selectedTracks) < 2 then
		display dialog "Please select at least two albums." buttons {"OK"}
		return
	end if
	
	-- Get original album name
	set originalName to album of item 1 of selectedTracks
	
	-- Append temporary suffix to all selected tracks
	set tempSuffix to " - TEMP"
	repeat with aTrack in selectedTracks
		set album of aTrack to (originalName & tempSuffix)
	end repeat
	
	display dialog "Suffix appended. Press OK to restore the original name." buttons {"OK"}
	
	-- Restore original album name
	repeat with aTrack in selectedTracks
		set album of aTrack to originalName
	end repeat
	
	display dialog "Album names restored." buttons {"Done"}
end tell
