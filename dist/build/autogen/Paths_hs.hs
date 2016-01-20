module Paths_hs (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [1,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/Namelos/Library/Haskell/bin"
libdir     = "/Users/Namelos/Library/Haskell/ghc-7.10.3-x86_64/lib/hs-1.0"
datadir    = "/Users/Namelos/Library/Haskell/share/ghc-7.10.3-x86_64/hs-1.0"
libexecdir = "/Users/Namelos/Library/Haskell/libexec"
sysconfdir = "/Users/Namelos/Library/Haskell/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hs_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hs_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "hs_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hs_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hs_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
