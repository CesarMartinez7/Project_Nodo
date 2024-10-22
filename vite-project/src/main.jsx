import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import {fetchBackend} from './App.jsx'
import './index.css'

createRoot(document.getElementById('root')).render(
  <fetchBackend></fetchBackend>
)
