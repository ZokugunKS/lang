require|extern sealed class Date

disclose date {
	static now(): Number
	static parse(date: String): Date
	getDate(): Number
	getDay(): Number
	getFullYear(): Number
	getHours(): Number
	getMilliseconds(): Number
	getMinutes(): Number
	getMonth(): Number
	getSeconds(): Number
	getTime(): Number
	getTimezoneOffset(): Number
	getUTCDate(): Number
	getUTCDay(): Number
	getUTCFullYear(): Number
	getUTCHours(): Number
	getUTCMilliseconds(): Number
	getUTCMinutes(): Number
	getUTCMonth(): Number
	getUTCSeconds(): Number
	setDate(value: Number): Number
	setFullYear(year: Number, month: Number = -1, day: Number = -1): Number
	setHours(hours: Number, minutes: Number = -1, seconds: Number = -1, ms: Number = -1): Number
	setMilliseconds(value: Number): Number
	setMinutes(minutes: Number = -1, seconds: Number = -1, ms: Number = -1): Number
	setMonth(value: Number, day: Number = -1): Number
	setSeconds(seconds: Number = -1, ms: Number = -1): Number
	setTime(value: Number): Number
	setUTCDate(value: Number): Number
	setUTCFullYear(year: Number, month: Number = -1, day: Number = -1): Number
	setUTCHours(hours: Number, minutes: Number = -1, seconds: Number = -1, ms: Number = -1): Number
	setUTCMilliseconds(value: Number): Number
	setUTCMinutes(minutes: Number = -1, seconds: Number = -1, ms: Number = -1): Number
	setUTCMonth(value: Number, day: Number = -1): Number
	setUTCSeconds(seconds: Number = -1, ms: Number = -1): Number
	toDateString(): String
	toISOString(): String
	toJSON(): String
	toString(): String
	toTimeString(): String
	toUTCString(): String
}

export Date