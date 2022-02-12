import { app } from './app'

const port = process.env.PORT || 4000
const name = process.env.npm_package_name
const version = process.env.npm_package_version

app.listen(port, () => {
	console.clear()
	console.log(`-> ${String(name).toUpperCase()}  v${version}\n`)
	if (process.env.TZ) console.log(`[INFO] ⏲  ${process.env.TZ}`)
	console.log(`[INFO] 🚀 Server is running on PORT ${port}`)
})
