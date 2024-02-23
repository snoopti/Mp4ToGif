import os
from moviepy.editor import VideoFileClip

defaultFps = 24
defaultSpeed = 2.0

def mp4_to_gif(mp4_file, gif_file, fps=defaultFps, speed=defaultSpeed):
    try:
        if not os.path.exists(mp4_file):
            print(f"Fehler: {mp4_file} nicht gefunden!")
            return
        if fps <= 0:
            print("Fehler: FPS muss größer als 0 sein!")
            return
        if speed <= 0:
            print("Fehler: Geschwindigkeit muss größer als 0 sein!")
            return
        clip = VideoFileClip(mp4_file)
        clip = clip.speedx(speed)
        clip.write_gif(gif_file, fps=fps)
        print(f"Erfolgreich: {mp4_file} wurde in {gif_file} konvertiert.")
    except Exception as e:
        print(f"Fehler beim Konvertieren von {mp4_file} zu GIF:", e)

mp4_dir = "./files"
gif_dir = "./files"

mp4_files = [os.path.join(mp4_dir, file) for file in os.listdir(mp4_dir) if file.endswith(".mp4")]

if not mp4_files:
    print("Keine MP4-Dateien im Verzeichnis gefunden.")
    exit()

fps = float(input(f"FPS = (Standardwert: {defaultFps}): ") or defaultFps)
speed = float(input(f"VideoSpeed = (Standardwert: {defaultSpeed}): ") or defaultSpeed)

for mp4_file in mp4_files:
    file_name = os.path.splitext(os.path.basename(mp4_file))[0]
    gif_file = os.path.join(gif_dir, file_name + ".gif")
    mp4_to_gif(mp4_file, gif_file, fps=fps, speed=speed)
