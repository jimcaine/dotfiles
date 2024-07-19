package wallpaper

import (
  "os"
  "io"
  "errors"
  "math/rand"
  "os/exec"
  "path/filepath"
)

type WallpaperService interface {
  UpdateWallpaper() error
}

type LocalFsWallpaperService struct {
  wallpaperDir string
}

func NewLocalFsWallpaperService(wallpaperDir string) (*LocalFsWallpaperService, error) {
  return &LocalFsWallpaperService{wallpaperDir: wallpaperDir}, nil
}

func (w *LocalFsWallpaperService) UpdateWallpaper() error {
  wallpaperPath, err := w.getRandomWallpaperPath()
  if err != nil {
    return err
  }

  cmd := exec.Command("swaybg", "-i", wallpaperPath, "-m", "fill")
  cmd.Stdout = io.Discard

  err = cmd.Start()

  if err != nil {
    return err
  }

  return nil
}

func (w *LocalFsWallpaperService) getRandomWallpaperPath() (string, error) {
  var files []string

  err := filepath.Walk(w.wallpaperDir, func(path string, info os.FileInfo, err error) error {
    if err != nil {
      return err
    }
    if !info.IsDir() {
      files = append(files, path)
    }
    return nil
  })

  if err != nil {
    return "", err
  }

  if len(files) == 0 {
    return "", errors.New("no wallpapers found")
  }

  wallpaperPath := files[rand.Intn(len(files))]
  return wallpaperPath, nil
}
