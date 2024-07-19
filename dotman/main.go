package main

import (
  "log"
  "github.com/jimcaine/dotfiles/dotman/pkg/wallpaper"
  "github.com/jimcaine/dotfiles/dotman/pkg/config"
)

func main() {
  config, err := config.NewConfig()
  if err != nil {
    log.Fatalf("Error loading config: %v", err)
  }


  wallpaperService, err := wallpaper.NewLocalFsWallpaperService(config.WallpaperDir)
  if err != nil {
    log.Fatalf("Error creating wallpaper service: %v", err)
  }

  wallpaperService.UpdateWallpaper()
}
