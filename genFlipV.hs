import Data.Bits
import Data.List
import Data.List.Split
import Data.Word
import Text.Printf

toBitsReversed :: Word8 -> [Bool]
toBitsReversed w = map (testBit w) [0 .. 7]

fromBits :: [Bool] -> Word8
fromBits = foldl (\a x -> 2 * a + fromIntegral (fromEnum x)) 0

main :: IO ()
main = putStrLn .
    ("  [ " ++) . (++ "\n  ]") .
    intercalate "\n  , " . map (intercalate ", ") . chunksOf 8 $
    map (printf "0x%02x" . fromBits . toBitsReversed) [0 .. 255]
