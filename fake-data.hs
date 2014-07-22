import Data.Word
import qualified Data.ByteString.Lazy as BSL

main :: IO ()
main = BSL.writeFile "FluidR3_GM.sf2" $
    BSL.pack (take (74199153 * 2) $ map fromIntegral [1 ..])
