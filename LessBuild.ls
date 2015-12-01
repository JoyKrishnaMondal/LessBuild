less = require "less"

delimit = require "path" |> (.sep)

cli = require "cli-color"

Red = cli.redBright

Yellow = cli.yellowBright

fs = require "fs" |> require "GetRidOfError"

{SetConfig,PrintSucess,PrintFailure} = require "GeneralDev"


Config =
	InitialExt:"less"
	FinalExtention:"css"
	Compile:(FileName) ->


		ReadFilePath = Config.DirToSave + delimit + FileName + "." + Config.InitialExt
		
		data <-! fs.readFile ReadFilePath,'utf8'

		error,output <-! less.render data

		if error

			CreatePath = Yellow(Config.DirToSave + delimit) + Red(FileName + "." + Config.InitialExt)

			console.log Red "Less Error " + CreatePath + (Yellow " Type:") + Red error.type + (Yellow " Line:[") + (Red error.line) + Yellow (":" +  error.column + "]")

			console.log Red error.extract

		else

			WriteFilePath = Config.DirToSave + delimit + FileName + "." + Config.FinalExtention

			<-! fs.writeFile WriteFilePath,output.css

			PrintSucess FileName



WithDir = (Init = true,watch = true,clean = false,DirToSave = process.cwd!,DirToLook = process.cwd!) ->

	Config.DirToSave = DirToSave

	Config.DirToLook = DirToLook

	AutoBuild = SetConfig Config

	AutoBuild Init,watch,clean

	return

module.exports = WithDir

