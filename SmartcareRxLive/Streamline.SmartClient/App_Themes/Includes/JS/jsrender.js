﻿/*! JsRender v0.9.87 (Beta): http://jsviews.com/#jsrender */
/*! **VERSION FOR WEB** (For NODE.JS see http://jsviews.com/download/jsrender-node.js) */
!function (e, t) { var n = t.jQuery; "object" == typeof exports ? module.exports = n ? e(t, n) : function (n) { if (n && !n.fn) throw "Provide jQuery or null"; return e(t, n) } : "function" == typeof define && define.amd ? define(function () { return e(t) }) : e(t, !1) }(function (e, t) { "use strict"; function n(e, t) { return function () { var n, r = this, i = r.base; return r.base = e, n = t.apply(r, arguments), r.base = i, n } } function r(e, t) { return ne(t) && (t = n(e ? e._d ? e : n(a, e) : a, t), t._d = 1), t } function i(e, t) { for (var n in t.props) !Ee.test(n) || e[n] && e[n].fix || (e[n] = r(e.constructor.prototype[n], t.props[n])) } function o(e) { return e } function a() { return "" } function s(e) { try { throw console.log("JsRender dbg breakpoint: " + e), "dbg breakpoint" } catch (t) { } return this.base ? this.baseApply(arguments) : e } function d(e) { this.name = (t.link ? "JsViews" : "JsRender") + " Error", this.message = e || this.name } function l(e, t) { if (e) { for (var n in t) e[n] = t[n]; return e } } function u(e, t, n) { return e ? re(e) ? u.apply(ee, e) : (le.delimiters = [e, t, he = n ? n.charAt(0) : he], pe = e.charAt(0), fe = e.charAt(1), ge = t.charAt(0), ve = t.charAt(1), e = "\\" + pe + "(\\" + he + ")?\\" + fe, t = "\\" + ge + "\\" + ve, X = "(?:(\\w+(?=[\\/\\s\\" + ge + "]))|(\\w+)?(:)|(>)|(\\*))\\s*((?:[^\\" + ge + "]|\\" + ge + "(?!\\" + ve + "))*?)", de.rTag = "(?:" + X + ")", X = new RegExp("(?:" + e + X + "(\\/)?|\\" + pe + "(\\" + he + ")?\\" + fe + "(?:(?:\\/(\\w+))\\s*|!--[\\s\\S]*?--))" + t, "g"), de.rTmpl = new RegExp("^\\s|\\s$|<.*>|([^\\\\]|^)[{}]|" + e + ".*" + t), ce) : le.delimiters } function c(e, t) { t || e === !0 || (t = e, e = void 0); var n, r, i, o, a = this, s = !t || "root" === t; if (e) { if (o = t && a.type === t && a, !o) if (n = a.views, a._.useKey) { for (r in n) if (o = t ? n[r].get(e, t) : n[r]) break } else for (r = 0, i = n.length; !o && r < i; r++) o = t ? n[r].get(e, t) : n[r] } else if (s) o = a.root; else for (; a && !o;) o = a.type === t ? a : void 0, a = a.parent; return o } function p() { var e = this.get("item"); return e ? e.index : void 0 } function f() { return this.index } function g(t, n, r) { var i, o, a, s, d = this, u = !we && void 0 !== n, c = d.ctx; if (t in c || t in (c = ae)) { if (a = c && c[t], "tag" === t || "root" === t || "parentTags" === t || d._.it === t) return a } else c = void 0; if ((!a || !ne(a) && d.linked || d.tagCtx) && (a && a._cxp || (c !== ae && (d = d.ctx && d.ctx.tag || d.root, c = d._ocps, a = c && c[t] || a), a && a._cxp || !r && !u || (a = de._crcp(t, a, d, c))), s = a && a._cxp)) { if (u) return de._ucp(t, n, d, s); if (r) return o = a[1] ? de._ceo(a[1].deps) : [_e], o.unshift(a[0]), o._cxp = s, o; a = a[1] ? s.tag && s.tag.cvtArgs ? s.tag.cvtArgs(void 0, 1, s.tagElse)[s.ind] : a[1](a[0].data, a[0], de) : a[0]._ocp } return a && ne(a) && (i = function () { return a.apply(this && this !== e ? this : d, arguments) }, l(i, a), i._vw = d), i || a } function v(e) { return e && (e.fn ? e : this.getRsc("templates", e) || ie(e)) } function h(e, t, n, r) { var o, a, s = "number" == typeof n && t.tmpl.bnds[n - 1], d = t.linkCtx; return void 0 === r && s && s._lr && (r = ""), void 0 !== r ? n = r = { props: {}, args: [r] } : s && (n = s(t.data, t, de)), s = s._bd && s, a = n.args[0], (e || s) && (o = d && d.tag, n.view = t, o || (o = l(new de._tg, { _: { inline: !d, bnd: s, unlinked: !0 }, tagName: ":", cvt: e, flow: !0, tagCtx: n }), d && (d.tag = o, o.linkCtx = d), n.ctx = Q(n.ctx, (d ? d.view : t).ctx), i(o, n)), o._er = r && a, o.ctx = n.ctx || o.ctx || {}, n.ctx = void 0, a = o.cvtArgs("true" !== e && e)[0]), a = s && t._.onRender ? t._.onRender(a, t, o) : a, void 0 != a ? a : "" } function m(e, t, n) { var r, i, o, a, s, d, l = this; if (l.tagName ? (d = l, l = d.tagCtxs ? d.tagCtxs[n || 0] : d.tagCtx) : (d = l.tag, n = l.index), s = d.bindTo, a = l.args, e = e || d.convert, "" + e === e && (e = l.view.getRsc("converters", e) || I("Unknown converter: '" + e + "'")), a.length || d.argDefault === !1 || l.index ? e && !t && (a = a.slice()) : a = [l.view.data], s) { for (o = [], r = s.length; r--;) i = s[r], o.unshift(w(l, i)); t && (a = o) } if (e) if (s = s || [0], e = e.apply(d, o || a), r = s.length, e = r < 2 ? [e] : e || [], t) a = e; else for (; r--;) i = s[r], +i === i && (a[i] = e ? e[r] : void 0); return a } function w(e, t) { return e = e[+t === t ? "args" : "props"], e && e[t] } function x(e) { return this.cvtArgs(void 0, !0, e) } function _(e, t) { for (var n, r, i = this; void 0 === n && i;) r = i.tmpl && i.tmpl[e], n = r && r[t], i = i.parent; return n || ee[e][t] } function b(e, t, n, r, o, a) { t = t || Y; var s, d, l, u, c, p, f, g, v, h, m, x, _, b, y, k, C, j, T, A, V, R, $ = 0, E = "", M = t.linkCtx || 0, N = t.ctx, P = n || t.tmpl, O = "number" == typeof r && t.tmpl.bnds[r - 1]; for ("tag" === e._is ? (s = e, e = s.tagName, r = s.tagCtxs, l = s.template) : (d = t.getRsc("tags", e) || I("Unknown tag: {{" + e + "}} "), l = d.template), void 0 === a && O && O._lr && (a = ""), void 0 !== a ? (E += a, r = a = [{ props: {}, args: [] }]) : O && (r = O(t.data, t, de)), f = r.length; $ < f; $++) h = r[$], (!M || !M.tag || $ && !M.tag._.inline || s._er) && ((b = P.tmpls && h.tmpl) && (b = h.content = P.tmpls[b - 1]), h.index = $, h.tmpl = b, h.render = S, h.view = t, h.ctx = Q(h.ctx, N)), (n = h.props.tmpl) && (h.tmpl = t.getTmpl(n)), s || (s = new d._ctr, y = !!s.init, s.parent = p = N && N.tag, s.tagCtxs = r, A = s.dataMap, M && (s._.inline = !1, M.tag = s, s.linkCtx = M), (s._.bnd = O || M.fn) ? s._.arrVws = {} : s.dataBoundOnly && I(e + " must be data-bound:\n{^{" + e + "}}")), _ = s.bindTo || [0], r = s.tagCtxs, A = s.dataMap, h.tag = s, A && r && (h.map = r[$].map), s.flow || (m = h.ctx = h.ctx || {}, u = s.parents = m.parentTags = N && Q(m.parentTags, N.parentTags) || {}, p && (u[p.tagName] = p), u[s.tagName] = m.tag = s); if (!(s._er = a)) { for (i(s, r[0]), s.rendering = {}, $ = 0; $ < f; $++) { if (h = s.tagCtx = r[$], T = h.props, s.ctx = h.ctx, $ || (y && (s.init(h, M, s.ctx), y = void 0), M && (M.attr = s.attr = M.attr || s.attr), c = s.attr, s._.noVws = c && c !== Pe), j = s.cvtArgs(void 0, void 0, $), s.linkedCtxParam) for (g = _.length; g--;) (x = s.linkedCtxParam[g]) && (R = _[g], h.ctx[x] = de._cp(w(h, R), w(h.params, R), h.view, s._.bnd && { tag: s, ind: g, tagElse: $ })); (k = T.dataMap || A) && (j.length || T.dataMap) && (C = h.map, C && C.src === j[0] && !o || (C && C.src && C.unmap(), C = h.map = k.map(j[0], T, void 0, !s._.bnd)), j = [C.tgt]), v = void 0, s.render && (v = s.render.apply(s, j), t.linked && v && !Me.test(v) && (n = { links: [] }, n.render = n.fn = function () { return v }, v = F(n, t.data, void 0, !0, t, void 0, void 0, s))), j.length || (j = [t]), void 0 === v && (V = j[0], s.contentCtx && (V = s.contentCtx === !0 ? t : s.contentCtx(V)), v = h.render(V, !0) || (o ? void 0 : "")), E = E ? E + (v || "") : v } s.rendering = void 0 } return s.tagCtx = r[0], s.ctx = s.tagCtx.ctx, s._.noVws && s._.inline && (E = "text" === c ? oe.html(E) : ""), O && t._.onRender ? t._.onRender(E, t, s) : E } function y(e, t, n, r, i, o, a, s) { var d, l, u, c = this, f = "array" === t; c.content = s, c.views = f ? [] : {}, c.parent = n, c.type = t || "top", c.root = n && n.root || t && c, c.data = r, c.tmpl = i, u = c._ = { key: 0, useKey: f ? 0 : 1, id: "" + Se++, onRender: a, bnds: {} }, c.linked = !!a, n ? (d = n.views, l = n._, l.useKey ? (d[u.key = "_" + l.useKey++] = c, c.index = qe, c.getIndex = p) : d.length === (u.key = c.index = o) ? d.push(c) : d.splice(o, 0, c), c.ctx = e || n.ctx) : c.ctx = e || {} } function k(e) { var t, n, r; for (t in Le) n = t + "s", e[n] && (r = e[n], e[n] = {}, ee[n](r, e)) } function C(e, t, n) { function i() { var t = this; t._ = { inline: !0, unlinked: !0 }, t.tagName = e } function o(e) { var n; (n = t[e]) && (t[e] = n = re(n) ? n : [n], (p || 1) !== n.length && I(e + " length not same as bindTo ")) } var a, s, d, u, c, p, f = t.bindTo, g = new de._tg; if (ne(t) ? t = { depends: t.depends, render: t } : "" + t === t && (t = { template: t }), void 0 !== f) for (f = t.bindTo = re(f) ? f : [f], u = p = f.length; u--;) c = f[u], isNaN(parseInt(c)) || (c = parseInt(c)), f[u] = c; if (o("linkedElement"), o("linkedCtxParam"), s = t.baseTag) { t.flow = !!t.flow, t.baseTag = s = "" + s === s ? n && n.tags[s] || se[s] : s, g = l(g, s); for (d in t) g[d] = r(s[d], t[d]) } else g = l(g, t); return void 0 !== (a = g.template) && (g.template = "" + a === a ? ie[a] || ie(a) : a), (i.prototype = g).constructor = g._ctr = i, n && (g._parentTmpl = n), g } function j(e) { return this.base.apply(this, e) } function T(e, n, r, i) { function o(n) { var o, s; if ("" + n === n || n.nodeType > 0 && (a = n)) { if (!a) if (/^\.\/[^\\:*?"<>]*$/.test(n)) (s = ie[e = e || n]) ? n = s : a = document.getElementById(n); else if (t.fn && !de.rTmpl.test(n)) try { a = t(n, document)[0] } catch (d) { } a && (i ? n = a.innerHTML : (o = a.getAttribute(Oe), o && (o !== Ue ? (n = ie[o], delete ie[o]) : t.fn && (n = t.data(a)[Ue])), o && n || (e = e || (t.fn ? Ue : n), n = T(e, a.innerHTML, r, i)), n.tmplName = e = e || o, e !== Ue && (ie[e] = n), a.setAttribute(Oe, e), t.fn && t.data(a, Ue, n))), a = void 0 } else n.fn || (n = void 0); return n } var a, s, d = n = n || ""; if (0 === i && (i = void 0, d = o(d)), i = i || (n.markup ? n : {}), i.tmplName = e, r && (i._parentTmpl = r), !d && n.markup && (d = o(n.markup)) && d.fn && (d = d.markup), void 0 !== d) return d.fn || n.fn ? d.fn && (s = d) : (n = $(d, i), U(d.replace(je, "\\$&"), n)), s || (s = l(function () { return s.render.apply(s, arguments) }, n), k(s)), s } function A(e, t) { return ne(e) ? e.call(t) : e } function V(e) { for (var t = [], n = 0, r = e.length; n < r; n++) t.push(e[n].unmap()); return t } function R(e, n) { function r(e) { u.apply(this, e) } function i() { return new r(arguments) } function o(e, t) { for (var n, r, i, o, a = 0; a < w; a++) i = p[a], n = void 0, i + "" !== i && (n = i, i = n.getter), void 0 === (o = e[i]) && n && void 0 !== (r = n.defaultVal) && (o = A(r, e)), t(o, n && c[n.type], i) } function a(t) { t = t + "" === t ? JSON.parse(t) : t; var n, r, i = 0, a = t, l = []; if (re(t)) { for (t = t || [], n = t.length; i < n; i++) l.push(this.map(t[i])); return l._is = e, l.unmap = d, l.merge = s, l } if (t) { o(t, function (e, t) { t && (e = t.map(e)), l.push(e) }), a = this.apply(this, l); for (r in t) r === te || _[r] || (a[r] = t[r]) } return a } function s(e) { e = e + "" === e ? JSON.parse(e) : e; var t, n, r, a, s, d, l, u, c, p = 0, f = this; if (re(f)) { for (l = {}, c = [], n = e.length, r = f.length; p < n; p++) { for (u = e[p], d = !1, t = 0; t < r && !d; t++) l[t] || (s = f[t], g && (l[t] = d = g + "" === g ? u[g] && (_[g] ? s[g]() : s[g]) === u[g] : g(s, u))); d ? (s.merge(u), c.push(s)) : c.push(i.map(u)) } return void (x ? x(f).refresh(c, !0) : f.splice.apply(f, [0, f.length].concat(c))) } o(e, function (e, t, n) { t ? f[n]().merge(e) : f[n](e) }); for (a in e) a === te || _[a] || (f[a] = e[a]) } function d() { var e, t, n, r, i = 0, o = this; if (re(o)) return V(o); for (e = {}; i < w; i++) t = p[i], n = void 0, t + "" !== t && (n = t, t = n.getter), r = o[t](), e[t] = n && r && c[n.type] ? re(r) ? V(r) : r.unmap() : r; for (t in o) "_is" === t || _[t] || t === te || "_" === t.charAt(0) && _[t.slice(1)] || ne(o[t]) || (e[t] = o[t]); return e } var l, u, c = this, p = n.getters, f = n.extend, g = n.id, v = t.extend({ _is: e || "unnamed", unmap: d, merge: s }, f), h = "", m = "", w = p ? p.length : 0, x = t.observable, _ = {}; for (r.prototype = v, l = 0; l < w; l++) !function (e) { e = e.getter || e, _[e] = l + 1; var t = "_" + e; h += (h ? "," : "") + e, m += "this." + t + " = " + e + ";\n", v[e] = v[e] || function (n) { return arguments.length ? void (x ? x(this).setProperty(e, n) : this[t] = n) : this[t] }, x && (v[e].set = v[e].set || function (e) { this[t] = e }) }(p[l]); return u = new Function(h, m.slice(0, -1)), u.prototype = v, v.constructor = u, i.map = a, i.getters = p, i.extend = f, i.id = g, i } function $(e, n) { var r, i = ue._wm || {}, o = l({ tmpls: [], links: {}, bnds: [], _is: "template", render: S }, n); return o.markup = e, n.htmlTag || (r = Ve.exec(e), o.htmlTag = r ? r[1].toLowerCase() : ""), r = i[o.htmlTag], r && r !== i.div && (o.markup = t.trim(o.markup)), o } function E(e, t) { function n(i, o, a) { var s, d, l, u = de.onStore[e]; if (i && typeof i === Ie && !i.nodeType && !i.markup && !i.getTgt && !("viewModel" === e && i.getters || i.extend)) { for (d in i) n(d, i[d], o); return o || ee } return void 0 === o && (o = i, i = void 0), i && "" + i !== i && (a = o, o = i, i = void 0), l = a ? "viewModel" === e ? a : a[r] = a[r] || {} : n, s = t.compile, null === o ? i && delete l[i] : (s && (o = s.call(l, i, o, a, 0), o._is = e), i && (l[i] = o)), u && u(i, o, a, s), o } var r = e + "s"; ee[r] = n } function M(e) { ce[e] = function (t) { return arguments.length ? (le[e] = t, ce) : le[e] } } function N(e) { function t(t, n) { this.tgt = e.getTgt(t, n) } return ne(e) && (e = { getTgt: e }), e.baseMap && (e = l(l({}, e.baseMap), e)), e.map = function (e, n) { return new t(e, n) }, e } function S(e, t, n, r, i, o) { var a, s, d, l, u, c, p, f, g = r, v = ""; if (t === !0 ? (n = t, t = void 0) : typeof t !== Ie && (t = void 0), (d = this.tag) ? (u = this, g = g || u.view, l = g.getTmpl(d.template || u.tmpl), arguments.length || (e = g)) : l = this, l) { if (!r && e && "view" === e._is && (g = e), g && e === g && (e = g.data), c = !g, we = we || c, g || ((t = t || {}).root = e), !we || ue.useViews || l.useViews || g && g !== Y) v = F(l, e, t, n, g, i, o, d); else { if (g ? (p = g.data, f = g.index, g.index = qe) : (g = Y, g.data = e, g.ctx = t), re(e) && !n) for (a = 0, s = e.length; a < s; a++) g.index = a, g.data = e[a], v += l.fn(e[a], g, de); else g.data = e, v += l.fn(e, g, de); g.data = p, g.index = f } c && (we = void 0) } return v } function F(e, t, n, r, i, o, a, s) { function d(e) { _ = l({}, n), _[x] = e } var u, c, p, f, g, v, h, m, w, x, _, b, k = ""; if (s && (w = s.tagName, b = s.tagCtx, n = n ? Q(n, s.ctx) : s.ctx, e === i.content ? h = e !== i.ctx._wrp ? i.ctx._wrp : void 0 : e !== b.content ? e === s.template ? (h = b.tmpl, n._wrp = b.content) : h = b.content || i.content : h = i.content, b.props.link === !1 && (n = n || {}, n.link = !1), (x = b.props.itemVar) && ("~" !== x.charAt(0) && O("Use itemVar='~myItem'"), x = x.slice(1))), i && (a = a || i._.onRender, n = Q(n, i.ctx)), o === !0 && (v = !0, o = 0), a && (n && n.link === !1 || s && s._.noVws) && (a = void 0), m = a, a === !0 && (m = void 0, a = i._.onRender), n = e.helpers ? Q(e.helpers, n) : n, _ = n, re(t) && !r) for (p = v ? i : void 0 !== o && i || new y(n, "array", i, t, e, o, a, h), i && i._.useKey && (p._.bnd = !s || s._.bnd && s), u = 0, c = t.length; u < c; u++) x && d(t[u]), f = new y(_, "item", p, t[u], e, (o || 0) + u, a, p.content), f._.it = x, g = e.fn(t[u], f, de), k += p._.onRender ? p._.onRender(g, f) : g; else x && d(t), p = v ? i : new y(_, w || "data", i, t, e, o, a, h), p._.it = x, k += e.fn(t, p, de); return s && (p.tag = s, p.tagElse = b.index, b.contentView = p), m ? m(k, p) : k } function P(e, t, n) { var r = void 0 !== n ? ne(n) ? n.call(t.data, e, t) : n || "" : "{Error: " + (e.message || e) + "}"; return le.onError && void 0 !== (n = le.onError.call(t.data, e, n && r, t)) && (r = n), t && !t.linkCtx ? oe.html(r) : r } function I(e) { throw new de.Err(e) } function O(e) { I("Syntax error\n" + e) } function U(e, t, n, r, i) { function o(t) { t -= v, t && m.push(e.substr(v, t).replace(ke, "\\n")) } function a(t, n) { t && (t += "}}", O((n ? "{{" + n + "}} block has {{/" + t + " without {{" + t : "Unmatched or missing {{/" + t) + ", in template:\n" + e)) } function s(s, d, l, p, g, x, _, b, y, k, C, j) { (_ && d || y && !l || b && ":" === b.slice(-1) || k) && O(s), x && (g = ":", p = Pe), y = y || n && !i; var T, A = (d || n) && [[]], V = "", R = "", $ = "", E = "", M = "", N = "", S = "", F = "", P = !y && !g; l = l || (b = b || "#data", g), o(j), v = j + s.length, _ ? f && m.push(["*", "\n" + b.replace(/^:/, "ret+= ").replace(Ce, "$1") + ";\n"]) : l ? ("else" === l && (Ae.test(b) && O('for "{{else if expr}}" use "{{else expr}}"'), A = w[8] && [[]], w[9] = e.substring(w[9], j), w = h.pop(), m = w[2], P = !0), b && B(b.replace(ke, " "), A, t).replace(Te, function (e, t, n, r, i, o, a, s) { return r = "'" + i + "':", a ? (R += o + ",", E += "'" + s + "',") : n ? ($ += r + "j._cp(" + o + ',"' + s + '",view),', N += r + "'" + s + "',") : t ? S += o : ("trigger" === i && (F += o), "lateRender" === i && (T = 1), V += r + o + ",", M += r + "'" + s + "',", c = c || Ee.test(i)), "" }).slice(0, -1), A && A[0] && A.pop(), u = [l, p || !!r || c || "", P && [], J(E || (":" === l ? "'#data'," : ""), M, N), J(R || (":" === l ? "data," : ""), V, $), S, F, T, A || 0], m.push(u), P && (h.push(w), w = u, w[9] = v)) : C && (a(C !== w[0] && "else" !== w[0] && C, w[0]), w[9] = e.substring(w[9], j), w = h.pop()), a(!w && C), m = w[2] } var d, l, u, c, p, f = le.allowCode || t && t.allowCode || ce.allowCode === !0, g = [], v = 0, h = [], m = g, w = [, , g]; if (f && t._is && (t.allowCode = f), n && (void 0 !== r && (e = e.slice(0, -r.length - 2) + ge), e = pe + e + ve), a(h[0] && h[0][2].pop()[0]), e.replace(X, s), o(e.length), (v = g[g.length - 1]) && a("" + v !== v && +v[9] === v[9] && v[0]), n) { for (l = L(g, e, n), p = [], d = g.length; d--;) p.unshift(g[d][8]); q(l, p) } else l = L(g, t); return l } function q(e, t) { var n, r, i = 0, o = t.length; for (e.deps = [], e.paths = []; i < o; i++) { e.paths.push(r = t[i]); for (n in r) "_jsvto" !== n && r.hasOwnProperty(n) && r[n].length && !r[n].skp && (e.deps = e.deps.concat(r[n])) } } function J(e, t, n) { return [e.slice(0, -1), t.slice(0, -1), n.slice(0, -1)] } function K(e, t) { return "\n\t" + (t ? t + ":{" : "") + "args:[" + e[0] + "]" + (e[1] || !t ? ",\n\tprops:{" + e[1] + "}" : "") + (e[2] ? ",\n\tctx:{" + e[2] + "}" : "") } function B(e, t, n) { function r(r, m, w, x, _, b, y, k, C, j, T, A, V, R, $, E, M, N, S, F) { function P(e, n, r, a, s, d, c, p) { var f = "." === r; if (r && (_ = _.slice(n.length), /^\.?constructor$/.test(p || _) && O(e), f || (e = (a ? 'view.ctxPrm("' + a + '")' : s ? "view" : "data") + (p ? (d ? "." + d : a ? "" : s ? "" : "." + r) + (c || "") : (p = a ? "" : s ? d || "" : r, "")), e += p ? "." + p : "", e = n + ("view.data" === e.slice(0, 9) ? e.slice(5) : e)), l)) { if (J = "linkTo" === i ? o = t._jsvto = t._jsvto || [] : u.bd, K = f && J[J.length - 1]) { if (K._cpfn) { for (; K.sb;) K = K.sb; K.bnd && (_ = "^" + _.slice(1)), K.sb = _, K.bnd = K.bnd || "^" === _.charAt(0) } } else J.push(_); h[g] = S + (f ? 1 : 0) } return e } x && !k && (_ = x + _), b = b || "", w = w || m || A, _ = _ || C, j = j || M || ""; var I, q, J, K, B, L = ")"; if ("[" === j && (j = "[j._sq(", L = ")]"), !y || d || s) { if (l && E && !d && !s && (!i || a || o) && (I = h[g - 1], F.length - 1 > S - (I || 0))) { if (I = F.slice(I, S + r.length), q !== !0) if (J = o || c[g - 1].bd, K = J[J.length - 1], K && K.prm) { for (; K.sb && K.sb.prm;) K = K.sb; B = K.sb = { path: K.sb, bnd: K.bnd } } else J.push(B = { path: J.pop() }); E = fe + ":" + I + " onerror=''" + ge, q = f[E], q || (f[E] = !0, f[E] = q = U(E, n, !0)), q !== !0 && B && (B._cpfn = q, B.prm = u.bd, B.bnd = B.bnd || B.path && B.path.indexOf("^") >= 0) } return d ? (d = !V, d ? r : A + '"') : s ? (s = !R, s ? r : A + '"') : (w ? (h[g] = S++, u = c[++g] = { bd: [] }, w) : "") + (N ? g ? "" : (p = F.slice(p, S), (i ? (i = a = o = !1, "\b") : "\b,") + p + (p = S + r.length, l && t.push(u.bd = []), "\b")) : k ? (g && O(e), l && t.pop(), i = _, a = x, p = S + r.length, l && (l = u.bd = t[i] = [], l.skp = !x), _ + ":") : _ ? _.split("^").join(".").replace(be, P) + (j ? (u = c[++g] = { bd: [] }, v[g] = L, j) : b) : b ? b : $ ? ($ = v[g] || $, v[g] = !1, u = c[--g], $ + (j ? (u = c[++g], v[g] = L, j) : "")) : T ? (v[g] || O(e), ",") : m ? "" : (d = V, s = R, '"')) } O(e) } var i, o, a, s, d, l = t && t[0], u = { bd: l }, c = { 0: u }, p = 0, f = (n ? n.links : l && (l.links = l.links || {})) || Y.tmpl.links, g = 0, v = {}, h = {}, m = (e + (n ? " " : "")).replace(ye, r); return !g && m || O(e) } function L(e, t, n) { var r, i, o, a, s, d, l, u, c, p, f, g, v, h, m, w, x, _, b, y, k, C, j, T, A, V, R, E, M, N, S, F = 0, P = ue.useViews || t.useViews || t.tags || t.templates || t.helpers || t.converters, I = "", U = {}, J = e.length; for ("" + t === t ? (_ = n ? 'data-link="' + t.replace(ke, " ").slice(1, -1) + '"' : t, t = 0) : (_ = t.tmplName || "unnamed", t.allowCode && (U.allowCode = !0), t.debug && (U.debug = !0), f = t.bnds, x = t.tmpls), r = 0; r < J; r++) if (i = e[r], "" + i === i) I += '\n+"' + i + '"'; else if (o = i[0], "*" === o) I += ";\n" + i[1] + "\nret=ret"; else { if (a = i[1], k = !n && i[2], s = K(i[3], "params") + "}," + K(v = i[4]), E = i[5], N = i[6], S = i[7], C = i[9] && i[9].replace(Ce, "$1"), (A = "else" === o) ? g && g.push(i[8]) : f && (g = i[8]) && (g = [g], F = f.push(1)), P = P || v[1] || v[2] || g || /view.(?!index)/.test(v[0]), (V = ":" === o) ? a && (o = a === Pe ? ">" : a + o) : (k && (b = $(C, U), b.tmplName = _ + "/" + o, b.useViews = b.useViews || P, L(k, b), P = b.useViews, x.push(b)), A || (y = o, P = P || o && (!se[o] || !se[o].flow), T = I, I = ""), j = e[r + 1], j = j && "else" === j[0]), M = E ? ";\ntry{\nret+=" : "\n+", h = "", m = "", V && (g || N || a && a !== Pe || S)) { if (R = new Function("data,view,j,u", "// " + _ + " " + ++F + " " + o + "\nreturn {" + s + "};"), R._er = E, R._tag = o, R._bd = !!g, R._lr = S, n) return R; q(R, g), w = 'c("' + a + '",view,', p = !0, h = w + F + ",", m = ")" } if (I += V ? (n ? (E ? "try{\n" : "") + "return " : M) + (p ? (p = void 0, P = c = !0, w + (R ? (f[F - 1] = R, F) : "{" + s + "}") + ")") : ">" === o ? (l = !0, "h(" + v[0] + ")") : (u = !0, "((v=" + v[0] + ")!=null?v:" + (n ? "null)" : '"")'))) : (d = !0, "\n{view:view,tmpl:" + (k ? x.length : "0") + "," + s + "},"), y && !j) { if (I = "[" + I.slice(0, -1) + "]", w = 't("' + y + '",view,this,', n || g) { if (I = new Function("data,view,j,u", " // " + _ + " " + F + " " + y + "\nreturn " + I + ";"), I._er = E, I._tag = y, g && q(f[F - 1] = I, g), I._lr = S, n) return I; h = w + F + ",undefined,", m = ")" } I = T + M + w + (I.deps && F || I) + ")", g = 0, y = 0 } E && (P = !0, I += ";\n}catch(e){ret" + (n ? "urn " : "+=") + h + "j._err(e,view," + E + ")" + m + ";}" + (n ? "" : "ret=ret")) } I = "// " + _ + "\nvar v" + (d ? ",t=j._tag" : "") + (c ? ",c=j._cnvt" : "") + (l ? ",h=j._html" : "") + (n ? ";\n" : ',ret=""\n') + (U.debug ? "debugger;" : "") + I + (n ? "\n" : ";\nreturn ret;"), le.debugMode !== !1 && (I = "try {\n" + I + "\n}catch(e){\nreturn j._err(e, view);\n}"); try { I = new Function("data,view,j,u", I) } catch (B) { O("Compiled template code:\n\n" + I + '\n: "' + (B.message || B) + '"') } return t && (t.fn = I, t.useViews = !!P), I } function Q(e, t) { return e && e !== t ? t ? l(l({}, t), e) : e : t && l({}, t) } function H(e) { return Fe[e] || (Fe[e] = "&#" + e.charCodeAt(0) + ";") } function D(e) { var t, n, r = []; if (typeof e === Ie) for (t in e) n = e[t], t !== te && e.hasOwnProperty(t) && !ne(n) && r.push({ key: t, prop: n }); return r } function Z(e, n, r) { var i = this.jquery && (this[0] || I("Unknown template")), o = i.getAttribute(Oe); return S.call(o && t.data(i)[Ue] || ie(i), e, n, r) } function z(e) { return void 0 != e ? $e.test(e) && ("" + e).replace(Ne, H) || e : "" } var G = t === !1; t = t && t.fn ? t : e.jQuery; var W, X, Y, ee, te, ne, re, ie, oe, ae, se, de, le, ue, ce, pe, fe, ge, ve, he, me, we, xe = "v0.9.87", _e = "_ocp", be = /^(!*?)(?:null|true|false|\d[\d.]*|([\w$]+|\.|~([\w$]+)|#(view|([\w$]+))?)([\w$.^]*?)(?:[.[^]([\w$]+)\]?)?)$/g, ye = /(\()(?=\s*\()|(?:([([])\s*)?(?:(\^?)(!*?[#~]?[\w$.^]+)?\s*((\+\+|--)|\+|-|&&|\|\||===|!==|==|!=|<=|>=|[<>%*:?\/]|(=))\s*|(!*?[#~]?[\w$.^]+)([([])?)|(,\s*)|(\(?)\\?(?:(')|("))|(?:\s*(([)\]])(?=\s*[.^]|\s*$|[^([])|[)\]])([([]?))|(\s+)/g, ke = /[ \t]*(\r\n|\n|\r)/g, Ce = /\\(['"])/g, je = /['"\\]/g, Te = /(?:\x08|^)(onerror:)?(?:(~?)(([\w$_\.]+):)?([^\x08]+))\x08(,)?([^\x08]+)/gi, Ae = /^if\s/, Ve = /<(\w+)[>\s]/, Re = /[\x00`><"'&=]/g, $e = /[\x00`><\"'&=]/, Ee = /^on[A-Z]|^convert(Back)?$/, Me = /^\#\d+_`[\s\S]*\/\d+_`$/, Ne = Re, Se = 0, Fe = { "&": "&amp;", "<": "&lt;", ">": "&gt;", "\0": "&#0;", "'": "&#39;", '"': "&#34;", "`": "&#96;", "=": "&#61;" }, Pe = "html", Ie = "object", Oe = "data-jsv-tmpl", Ue = "jsvTmpl", qe = "For #index in nested block use #getIndex().", Je = {}, Ke = e.jsrender, Be = Ke && t && !t.render, Le = { template: { compile: T }, tag: { compile: C }, viewModel: { compile: R }, helper: {}, converter: {} }; if (ee = { jsviews: xe, sub: { View: y, Err: d, tmplFn: U, parse: B, extend: l, extendCtx: Q, syntaxErr: O, onStore: { template: function (e, t) { null === t ? delete Je[e] : Je[e] = t } }, addSetting: M, settings: { allowCode: !1 }, advSet: a, _ths: i, _gm: r, _tg: function () { }, _cnvt: h, _tag: b, _er: I, _err: P, _html: z, _cp: o, _sq: function (e) { return "constructor" === e && O(""), e } }, settings: { delimiters: u, advanced: function (e) { return e ? (l(ue, e), de.advSet(), ce) : ue } }, map: N }, (d.prototype = new Error).constructor = d, p.depends = function () { return [this.get("item"), "index"] }, f.depends = "index", y.prototype = { get: c, getIndex: f, getRsc: _, getTmpl: v, ctxPrm: g, _is: "view" }, de = ee.sub, ce = ee.settings, !(Ke || t && t.render)) { for (W in Le) E(W, Le[W]); oe = ee.converters, ae = ee.helpers, se = ee.tags, de._tg.prototype = { baseApply: j, cvtArgs: m, bndArgs: x, ctxPrm: g }, Y = de.topView = new y, t ? (t.fn.render = Z, te = t.expando, t.observable && (l(de, t.views.sub), ee.map = t.views.map)) : (t = {}, G && (e.jsrender = t), t.renderFile = t.__express = t.compile = function () { throw "Node.js: use npm jsrender, or jsrender-node.js" }, t.isFunction = function (e) { return "function" == typeof e }, t.isArray = Array.isArray || function (e) { return "[object Array]" === {}.toString.call(e) }, de._jq = function (e) { e !== t && (l(e, t), t = e, t.fn.render = Z, delete t.jsrender, te = t.expando) }, t.jsrender = xe), le = de.settings, le.allowCode = !1, ne = t.isFunction, t.render = Je, t.views = ee, t.templates = ie = ee.templates; for (me in le) M(me); (ce.debugMode = function (e) { return void 0 === e ? le.debugMode : (le.debugMode = e, le.onError = e + "" === e ? new Function("", "return '" + e + "';") : ne(e) ? e : void 0, ce) })(!1), ue = le.advanced = { useViews: !1, _jsv: !1 }, se({ "if": { render: function (e) { var t = this, n = t.tagCtx, r = t.rendering.done || !e && (arguments.length || !n.index) ? "" : (t.rendering.done = !0, t.selected = n.index, n.render(n.view, !0)); return r }, flow: !0 }, "for": { render: function (e) { var t, n = !arguments.length, r = this, i = r.tagCtx, o = "", a = 0; return r.rendering.done || (t = n ? i.view.data : e, void 0 !== t && (o += i.render(t, n), a += re(t) ? t.length : 1), (r.rendering.done = a) && (r.selected = i.index)), o }, flow: !0 }, props: { baseTag: "for", dataMap: N(D), flow: !0 }, include: { flow: !0 }, "*": { render: o, flow: !0 }, ":*": { render: o, flow: !0 }, dbg: ae.dbg = oe.dbg = s }), oe({ html: z, attr: z, url: function (e) { return void 0 != e ? encodeURI("" + e) : null === e ? e : "" } }) } return le = de.settings, re = (t || Ke).isArray, ce.delimiters("{{", "}}", "^"), Be && Ke.views.sub._jq(t), t || Ke }, window);
//# sourceMappingURL=jsrender.min.js.map