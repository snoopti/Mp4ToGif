import os
from moviepy.editor import VideoFileClip
import tkinter as tk
from tkinter import simpledialog, messagebox

defaultFps = 24
defaultSpeed = 2.0


def mp4_to_gif(mp4_file, gif_file, fps=defaultFps, speed=defaultSpeed):
    try:
        if not os.path.exists(mp4_file):
            messagebox.showerror("Fehler", f"Datei {mp4_file} nicht gefunden!")
            return
        if fps <= 0:
            messagebox.showerror("Fehler", "FPS muss größer als 0 sein!")
            return
        if speed <= 0:
            messagebox.showerror("Fehler", "Geschwindigkeit muss größer als 0 sein!")
            return
        clip = VideoFileClip(mp4_file)
        clip = clip.speedx(speed)
        clip.write_gif(gif_file, fps=fps)
        messagebox.showinfo(
            "Erfolg", f"{mp4_file} wurde erfolgreich in {gif_file} konvertiert."
        )
    except Exception as e:
        messagebox.showerror(
            "Fehler", f"Fehler beim Konvertieren von {mp4_file} zu GIF: {e}"
        )


mp4_dir = "./files"
gif_dir = "./files"

mp4_files = [
    os.path.join(mp4_dir, file) for file in os.listdir(mp4_dir) if file.endswith(".mp4")
]

if not mp4_files:
    messagebox.showerror(f"Fehler", f"Keine MP4-Dateien in {mp4_dir} gefunden.")
    exit()

root = tk.Tk()
root.withdraw()

fps = simpledialog.askfloat(
    "FPS",
    f"FPS: (Standard: {defaultFps}):",
    initialvalue=defaultFps,
)
speed = simpledialog.askfloat(
    "VideoSpeed",
    f"Geschwindigkeit: (Standard: {defaultSpeed}):",
    initialvalue=defaultSpeed,
)

for mp4_file in mp4_files:
    file_name = os.path.splitext(os.path.basename(mp4_file))[0]
    gif_file = os.path.join(gif_dir, file_name + ".gif")
    mp4_to_gif(mp4_file, gif_file, fps=fps, speed=speed)
