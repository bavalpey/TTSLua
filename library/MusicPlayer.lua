---@meta MusicPlayer

---# Music Player

---`MusicPlayer` is a static global class which allows you to control the in-game music player i.e. the in-game "Music" menu.
---@class MusicPlayer: userdata
---@field loaded bool **Read Only** If all players loaded the current audioclip.
---@field player_status "Stop"|"Play"|"Loading"|"Ready" **Read Only** The current state of the music player.
---@field playlist_index int Current index of the playlist. `-1` if no playlist audioclip is playing.
---@field repeat_track bool If the current audio clip should be repeated.
---@field shuffle bool If the playlist should play shuffled.
MusicPlayer = {
	---*Use [playlist_index](#playlist_index) instead.*
	---@type int
	---@deprecated
	playlistIndex = ...,
}

---Parameters for the music player's playlist used by `MusicPlayer.setPlaylist` and `MusicPlayer.setCurrentAudioclip`.
---@class MusicPlayer.Playlist.Parameters
---@field url string The url for the audioclip.
---@field title string The title for the audio clip.

---Properties for the music player's playlist returned `MusicPlayer.getPlaylist` and `MusicPlayer.getCurrentAudioClip`.
---@class MusicPlayer.Playlist.Properties
---@field url string The url of the audioclip.
---@field title string The title of the audioclip.

function MusicPlayer.getCurrentAudioClip() end

---Gets the current playlist.
---@return MusicPlayer.Playlist.Properties[]
---
---***
---
---### Example Usage
---Print the track number and title of each audioclip making up the playlist.
---```
---local playlist = MusicPlayer.getPlaylist()
---for i, clip in ipairs(playlist) do
---    print(i .. " - " .. clip.title)
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/musicplayer/#getplaylist)
---
function MusicPlayer.getPlaylist() end

---Pause the current audoclip.
---@return bool # `true` if the music player is/was paused, otherwise `false`.
---
---***
---
---### Example Usage
---Pause the current track.
---```
---MusicPlayer.pause()
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/musicplayer/#pause)
---
function MusicPlayer.pause() end

---Plays/Resume the current audioclip.
---@return bool # `true` if the music player is/was playing, otherwise `false`.
---
---***
---
---### Example Usage
---Play the current track.
---```
---MusicPlayer.play()
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/musicplayer/#play)
---
function MusicPlayer.play() end

---Set/load the specified audioclip.
---@param parameters MusicPlayer.Playlist.Parameters
---@return bool
---
---***
---
---### Example Usage
---Set the current audioclip to a specific URL.
---```
---MusicPlayer.setCurrentAudioclip({
---    url = "https://domain.example/path/to/clip.mp3",
---    title = "Example"
---})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/musicplayer/#setcurrentaudioclip)
---
function MusicPlayer.setCurrentAudioclip(parameters) end

---Sets the current playlist.
---@param playlist MusicPlayer.Playlist.Parameters[]
---@return bool
---
---***
---
---### Example Usage
---Set the current playlist to include three pieces of music.
---```
---MusicPlayer.setPlaylist({
---    {
---        url = "https://domain.example/path/to/clip.mp3",
---        title = "Example"
---    },
---    {
---        url = "https://domain.example/path/to/clip2.mp3",
---        title = "Example #2"
---    },
---    {
---        url = "https://domain.example/path/to/clip3.mp3",
---        title = "Example #3"
---    }
---})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/musicplayer/#setplaylist)
function MusicPlayer.setPlaylist(playlist) end

---Skips to the beginning of the audioclip or if the play time is less than 3 seconds to the previous audioclip in
---playlist if possible. Returns true if skip was successful, otherwise returns false.
---@return bool
---
---***
---
---### Example Usage
---Skip backwards to either the beginning of the audioclip, or the prior audioclip in the playlist.
---```
---MusicPlayer.skipBack()
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/musicplayer/#skipback)
function MusicPlayer.skipBack() end

---Skips to the next audioclip in the playlist if possible. Returns true if skip was successful, otherwise returns false.
---@return bool
---
---***
---
---### Example Usage
---Skip to the next audioclip.
---```
---MusicPlayer.skipForward()
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/musicplayer/#skipforward)
function MusicPlayer.skipForward() end
