// import 'dotenv/config'
import express from 'express'
// import cors from 'cors'
// import helmet from 'helmet'
import { join } from 'path'

// import { router } from './routes'

const app = express()

app.disable('x-powered-by')

// app.use(cors())
// app.use(helmet())

app.use('/', express.static(join(__dirname, '..', 'public')))

app.get('/', (request, response) => {
	return response.json({ status: true })
})

// app.use(router)

export { app }
