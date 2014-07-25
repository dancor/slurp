import Data.Bits
import qualified Data.ByteString as BS
import Data.Int
import qualified Data.Vector.Storable as SVec
import Data.Vector.Storable.ByteString
import Data.Word
import System.ByteOrder

flipWord16 :: Word16 -> Word16
flipWord16 w = (fromIntegral b1 `shiftL` 8) .|. fromIntegral b2
  where
    b2 = fromIntegral (w `shiftR` 8) :: Word8
    b1 = fromIntegral w :: Word8

main :: IO ()
main = do
    c <- BS.readFile "FluidR3_GM.sf2"
    let v0 = byteStringToVector c :: SVec.Vector Int16
        v = case byteOrder of
          LittleEndian -> v0
          BigEndian -> SVec.map (fromIntegral . flipWord16 . fromIntegral) v0
          _ -> error "Machine has unknown byte order."
    print $ SVec.length v
    print $ v SVec.! 0
    print $ v SVec.! 4567
