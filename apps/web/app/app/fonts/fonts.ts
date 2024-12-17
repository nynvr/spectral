import { Inter, Roboto_Mono, JetBrains_Mono } from "next/font/google";

const robotoMono = Roboto_Mono({ subsets: ["latin"], fallback: ["courier", "monospace"] })
const inter = Inter({ subsets: ["latin"], fallback: ["courier", "monospace"] })
const jetBrainsMono = JetBrains_Mono({ subsets: ["latin"], fallback: ["courier", "monospace"] })

export {
  robotoMono,
  inter,
  jetBrainsMono,
}