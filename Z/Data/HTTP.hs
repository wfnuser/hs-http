{-# LANGUAGE DataKinds #-}

module Z.Data.HTTP where

import qualified Z.Data.Builder as B
import Z.Data.CBytes
import qualified Z.Data.Vector as V
import Z.IO
import Z.IO.Network

type Host :: *

type Host = (HostName, PortNumber)

hostToBytes :: Host -> V.Bytes
hostToBytes (hostName, portNumber) = toBytes hostName 

defaultPortHTTP :: PortNumber
defaultPortHTTP = 80

data HTTPClient = HTTPClient
  { httpClientIn :: BufferedInput,
    httpClientOut :: BufferedOutput
  }
