package config

import (
  "fmt"
  "os"
)

type DotmanConfig struct {
  WallpaperDir string
}

func NewConfig() (*DotmanConfig, error) {
  wallpaperDir, err := getWallpaperDir()
  if err != nil {
    return nil, err
  }

  return &DotmanConfig{WallpaperDir: wallpaperDir}, nil
}

func getWallpaperDir() (string, error) {
  wallpaperDir, ok := os.LookupEnv("WALLPAPER_DIR")
  if !ok {
    return "", fmt.Errorf("WALLPAPER_DIR environment variable not set")
  }

  return wallpaperDir, nil
}
