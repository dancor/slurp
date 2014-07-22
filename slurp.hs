import Data.Binary.Get
import qualified Data.ByteString.Lazy as BSL
import Data.Int
import qualified Data.Vector.Unboxed as UVec
import qualified Data.Vector.Unboxed.Mutable as UVecM
import System.IO.Unsafe

getUVecNOf :: (UVecM.Unbox a) => Int -> Get a -> Get (UVec.Vector a)
getUVecNOf n getter = do
    mv <- return $ unsafePerformIO $ UVecM.new n
    let fill i
            | i < n = do
                x <- getter
                (unsafePerformIO $ UVecM.unsafeWrite mv i x) `seq` return ()
                fill (i + 1)
            | otherwise = return ()
    fill 0
    return $ unsafePerformIO $ UVec.unsafeFreeze mv

getInt16le :: Get Int16
getInt16le = fmap fromIntegral getWord16le

main :: IO ()
main = do
    c <- BSL.readFile "FluidR3_GM.sf2"
    let v = runGet (getUVecNOf 74199153 getInt16le) c
    print $ UVec.length v
    print $ v UVec.! 0
    print $ v UVec.! 4567
